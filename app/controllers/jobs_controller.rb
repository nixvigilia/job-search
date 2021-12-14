class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show, :search]

  # GET /jobs or /jobs.json
  def index
      @jobs = Job.published.desc
    if params[:search].blank?
      @jobs
    else
      @search = params[:search].downcase
      @jobs = Job.published.desc.where('lower(title) LIKE :search', search: "%#{@search}%")
    end
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    if !params[:job][:company_logo].empty?
      @job.company_logo.attach(data: params[:job][:company_logo], filename: "1_#{Time.current.to_i}", )
    end
    @job.user = current_user
    
    if @job.save
      render json: { redirect_url: job_url(@job), notice: "Thanks for posting! Your job is now pending review." }
    else
      render json: @job.errors
    end

  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def intents
    intent_amount = case params[:upsell_type].parameterize
    when Job::UPSELL_TYPES[:no_thanks]
      Job::PRICING[:base]
    when Job::UPSELL_TYPES[:good]
      Job::PRICING[:good]
    when Job::UPSELL_TYPES[:better]
      Job::PRICING[:better]
    when Job::UPSELL_TYPES[:great]
      Job::PRICING[:great]
    else
      Job::PRICING[:base]
    end

    intent_amount = intent_amount * 100

    @intent = Stripe::PaymentIntent.create({
      amount: intent_amount,
      currency: "usd",
      payment_method_types: ["card"]
    })

    render json: @intent
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.

  
  def job_params
    params.require(:job).permit(
      :company_email,
      :company_name, 
      :company_website, 
      :company_description, 
      :compensation_range,
      :compensation_type,  
      :description, 
      :estimated_hours, 
      # :featured_until, 
      :headquarters, 
      :link_to_apply, 
      :price, 
      :remote, 
      :title, 
      :upsell_type, 
      :years_of_experience)
  end
end
