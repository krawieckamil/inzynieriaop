# Class with all trainings methods
class TrainingsController < ApplicationController

before_action :authenticate_user!

# Define new training
def new
@training = Training.new
end

# Create new training
def create
@training = Training.new(training_params)
if @training.save
redirect_to @training
else
render 'new'
end
#render plain: params[:training].inspect
end

# Show training by id
# * *Args*    :
  # - +id+ -> the id of training
def show
@training = Training.find(params[:id])
end

# Show all trainings
def index
@trainings = Training.all
end

# Edit training by id:
# * *Args*    :
  # - +id+ -> the id of training
def edit
@training = Training.find(params[:id])
end

# Update training
# * *Args*    :
  # - +id+ -> the id of training
def update
@training = Training.find(params[:id])

if @training.update(training_params)
redirect_to @training
else
render 'edit'
end
end
# Delete training in database
# * *Args*    :
  # - +id+ -> the id of training
def destroy
@training = Training.find(params[:id])
@training.destroy

redirect_to trainings_path
end

private
def training_params
params.require(:training).permit(:title, :text)
end

end
