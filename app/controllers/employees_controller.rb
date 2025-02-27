class EmployeesController < ApplicationController

    def index 
        @employees = Employee.all
    end 

    def show 
        @employee = Employee.find(params[:id])
    end 

    def new
        @employee = Employee.new
    end 

    def create
        @employee = Employee.create(post_params)
        

        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :new
        end 
    end 

    def edit 
        @employee = Employee.find(params[:id]) 
    end 

    def update 
        @employee = Employee.find(params[:id])
        @employee.update(post_params)
        
        
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :edit
        end 
    end 

    private

    def post_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end 
end

