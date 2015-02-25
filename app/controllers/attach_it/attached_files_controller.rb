require_dependency "attach_it/application_controller"

module AttachIt
  class AttachedFilesController < ApplicationController
    before_action :set_attached_file, only: [:destroy, :download]

    def index
      @attached_files = AttachedFile.all
      render :json => @attached_files
    end

    def create
      @attached_file = AttachedFile.new(attached_file_params)
      if @attached_file.save
        respond_to do |format|
          format.json {  
            render :json => @attached_file           
          }
        end
      else 
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end

    def destroy
      @attached_file = AttachedFile.find(params[:id])
      @attached_file.destroy
      render :json => true
    end

    def download
      send_file(@attached_file.file_data.path,
                filename: @attached_file.file_data_name,
                type: @attached_file.file_data.mime_type)
    end

    private

    def set_attached_file
      @attached_file = AttachedFile.find(params[:id]) 
    end

    def attached_file_params
      params.require(:attached_file).permit!
    end
  end
end
