class InstructorsController < ApplicationController
    #GET /instructors
    def index
        instructors = Instructor.all
        render json: instructors
    end
    
    #GET /instructors/:id
    def show
        instructor = find_instructor
        render json: instructor
    end
    
    #POST /instructors
    def create
        instructors = Instructor.create(instructor_params)
        render json: instructors, status: :created
    end

    #PATCH /instructor/:id
    def update
        instructor = find_instructor
        instructor.update(instructor_params)
        render json: instructor, status: :ok
    end
    
    #DELETE /instructors/:id
    def destroy
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end

    private
    
    def find_instructor
        instructor = Instructor.find_by(id: params[:id])
    end

    def instructor_params
        params.permit( :name )
    end
end
