module Api
  module V1
    class CnabController < Api::V1::ApiController
      def parse_cnab
        return unless params[:file]
    
        parser = Parser.new(file: params[:file], current_user: current_user)
    
        if parser.valid? && parser.call
          redirect_to root_path, notice: I18n.t('.parser_success')
        else
          redirect_to root_path, alert: I18n.t('.parser_failure')
        end
      end
    end
  end
end
