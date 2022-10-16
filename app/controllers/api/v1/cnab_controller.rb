module Api
  module V1
    class CnabController < Api::V1::ApiController
      def parse_cnab
        return unless params[:file]

        data = ParseFileService.new(file: params[:file].tempfile).call
        render json: { error: 'The file count not be parsed' } unless data

        cnab_file = PersistDataService.new(data: data, user: current_user).call

        if cnab_file
          render json: cnab_file.to_json(
            include: { stores: { include: {
              transactions: { except: %i[created_at updated_at store_id] }
            }, only: %i[id name owner] } }, only: :id
          ), status: :created
        else
          render json: { error: 'Data could not be persisted' }, status: :unprocessable_entity
        end
      end
    end
  end
end
