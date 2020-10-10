class CompaniesController < ApplicationController
    
    def index
      @companies = Company.all
    end

    def new
      @company = Company.new
    end

    def show
      @company = Company.find(params[:id])
    end
    
    def edit
      @company = Company.find(params[:id])
    end

    def create
      @company = Company.new(company_params)
      if @company.save
        flash[:notice] = 'Company was successfully created.'
        redirect_to new_user_registration_path
      else
        render action: "new"
      end
    end

    def update
      if @company.update(company_params)
        redirect_to @company, notice: 'Company was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @video.destroy
      redirect_to root_path, notice: 'Video was successfully destroyed.'
    end

    private

    def company_params
        params.require(:company).permit(:name, :corporate_name, :cnpj, 
            :address, :domain)
    end
end
