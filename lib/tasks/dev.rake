require 'faker'
require 'ffaker'
namespace :dev do
    DEFAULT_PASSWORD = 123456
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
      if Rails.env.development?
        show_spinner("Apagando BD...") {%x(rails db:drop)}
           
        show_spinner("Criando BD...") {%x(rails db:create)}
        
        show_spinner("Migrando o BD...") {%x(rails db:migrate)}
         
        show_spinner("Cadastrando empresa padrão...") {%x(rails dev:add_default_company)}

        show_spinner("Cadastrando usuario dono da empresa padrão...") {%x(rails dev:add_user_owner_company_default)}
      else
        puts "Você não está no ambiente de desenvolvimento"
      end
    end

    desc "Adiciona a Empresa Padrão"
    task add_default_company: :environment do
        c = Company.new(
          name: "Nubank",
          corporate_name: "Nu Pagamentos S.A.",
          cnpj: Faker::Company.brazilian_company_number(formatted: true),
          address: FFaker::AddressBR.full_address,
          domain: FFaker::InternetSE.domain_name
        )
        c.save!
    end


    desc "Adciona usuario dono da empresa padrão"
    task add_user_owner_company_default: :environment do
        c = Company.all.first
        u = User.new(
            name:  FFaker::Name.name,
            email: "john.doe@example.com",
            password: DEFAULT_PASSWORD,
            password_confirmation: DEFAULT_PASSWORD,
            admin: true,
            company_id: c.id
        )
        u.save!
    end
    private
        def show_spinner(msg_start, msg_end = "Concluido")
            spinner = TTY::Spinner.new("[:spinner) #{msg_start}", format: :dots_9)
            spinner.auto_spin
            yield
            spinner.success("#{msg_end}")
        end
end

