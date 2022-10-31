class JobPostsController < ApplicationController

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.create params.require(:job_post)
    .permit(
      :title,
      :description,
      :location,
      :company_name,
      :min_salary,
      :max_salary
    )

    if @job_post.persisted? # or @job_post.save
      redirect_to @job_post 
      # redirect_to job_post_path(@job_post) 
      # ^^alternate
    else
      render :new
    end
  end

  def show
    @job_post = JobPost.find params[:id]
  end

  def index
    @job_posts = JobPost.all.order(created_at: :desc)
  end

  def edit
    
  end

  def update
    @job_post = JobPost.find params[:id]
    @job_post.update params.require(:job_post)
    .permit(
      :title,
      :description,
      :location,
      :company_name,
      :min_salary,
      :max_salary
    )
    redirect_to @job_post
  end

  def destroy
    @job_post = JobPost.find params[:id]
    @job_post.destroy
    flash[:danger] = "deleted job post"
    redirect_to job_posts_path
  end

end
