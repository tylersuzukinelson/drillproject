class SolutionsController < ApplicationController
  	before_action :find_solution, 
                  only: [ :edit, :update, :destroy]
    before_action :find_drill, only: [ :new, :create, :edit, :destroy ]

	def new
		@solution = Solution.new 
		
		render :new
	end

	def create
		@solution = Solution.new solution_params
		@solution.drill = @drill

		if @solution.save
			redirect_to @solution.drill, notice: "Drill solution successfully created!" 
		else
			flash[:alert] = get_errors
			render :new 
		end
	end

	def edit
	end

	def update
		if @solution.update solution_params
      		redirect_to @solution.drill, notice: "Drill solution updated successfully!" 
   	 	else
   	 		flash[:alert] = get_errors
      		render :edit
    	end
	end

	def destroy
		if @solution.destroy
    		redirect_to drill_path(@drill), notice: "Drill solution deleted successfully!" 
    	else
      		flash[:alert] = get_errors
      		redirect_to @solution.drill
    	end
    		
	end

private
	
	def solution_params
		params.require(:solution).permit(:content, :exact_match)
	end

	 def find_solution
    	@solution = Solution.find params[:id]
  	end

  	def find_drill
  		@drill = Drill.find params[:drill_id]
  	end

  	def get_errors
    	@solution.errors.full_messages.join('; ')
  	end
end
