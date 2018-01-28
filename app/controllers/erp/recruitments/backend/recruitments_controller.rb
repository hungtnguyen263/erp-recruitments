module Erp
  module Recruitments
    module Backend
      class RecruitmentsController < Erp::Backend::BackendController
        before_action :set_recruitment, only: [:show, :edit, :update, :destroy,
                                               :set_active, :set_deleted]
    
        # GET /recruitments
        def list
          @recruitments = Recruitment.search(params).paginate(:page => params[:page], :per_page => 10)
          
          render layout: nil
        end
    
        # GET /recruitments/1
        def show
        end
    
        # GET /recruitments/new
        def new
          @recruitment = Recruitment.new
          
          if request.xhr?
            render '_form', layout: nil, locals: {recruitment: @recruitment}
          end
        end
    
        # GET /recruitments/1/edit
        def edit
        end
    
        # POST /recruitments
        def create
          @recruitment = Recruitment.new(recruitment_params)
          @recruitment.creator = current_user
          @recruitment.status = Erp::Recruitments::Recruitment::STATUS_ACTIVE
    
          if @recruitment.save
            if request.xhr?
              render json: {
                status: 'success',
                text: @recruitment.name,
                value: @recruitment.id
              }
            else
              redirect_to erp_recruitments.edit_backend_recruitment_path(@recruitment), notice: t('.success')
            end
          else
            if request.xhr?
              render '_form', layout: nil, locals: {recruitment: @recruitment}
            else
              render :new
            end
          end
        end
    
        # PATCH/PUT /recruitments/1
        def update
          @recruitment.status = Erp::Recruitments::Recruitment::STATUS_ACTIVE
          if @recruitment.update(recruitment_params)
            if request.xhr?
              render json: {
                status: 'success',
                text: @recruitment.name,
                value: @recruitment.id
              }
            else
              redirect_to erp_recruitments.edit_backend_recruitment_path(@recruitment), notice: t('.success')
            end
          else
            render :edit
          end
        end
    
        # DELETE /recruitments/1
        def destroy
          @recruitment.destroy
          
          respond_to do |format|
            format.html { redirect_to erp_recruitments.backend_recruitments_path, notice: t('.success') }
            format.json {
              render json: {
                'message': t('.success'),
                'type': 'success'
              }
            }
          end
        end
        
        def set_active
          @recruitment.set_active

          respond_to do |format|
          format.json {
            render json: {
            'message': t('.success'),
            'type': 'success'
            }
          }
          end
        end
        
        def set_deleted
          @recruitment.set_deleted

          respond_to do |format|
          format.json {
            render json: {
            'message': t('.success'),
            'type': 'success'
            }
          }
          end
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_recruitment
            @recruitment = Recruitment.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def recruitment_params
            params.fetch(:recruitment, {}).permit(:name, :deadline, :position, :salary_grade, :task, :require, :interest, :description)
          end
      end
    end
  end
end
