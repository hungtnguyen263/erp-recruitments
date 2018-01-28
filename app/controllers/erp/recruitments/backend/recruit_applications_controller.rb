module Erp
  module Recruitments
    module Backend
      class RecruitApplicationsController < ApplicationController
        before_action :set_recruit_application, only: [:show, :edit, :update, :destroy]
    
        # GET /recruit_applications
        def list
          @recruit_applications = RecruitApplication.search(params).paginate(:page => params[:page], :per_page => 10)
          
          render layout: nil
        end
    
        # DELETE /recruit_applications/1
        def destroy
          @recruit_application.destroy
          
          respond_to do |format|
            format.html { redirect_to erp_recruitments.backend_recruit_applications_path, notice: t('.success') }
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
          def set_recruit_application
            @recruit_application = RecruitApplication.find(params[:id])
          end
      end
    end
  end
end
