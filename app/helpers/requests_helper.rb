module RequestsHelper
    def request_valid(request, params)
        request.category_id = params[:categories]['name']
        request.approver_id = params[:approver_user]['name']
        request.price = params[:price]
        request.body = params[:body]
        
        if not request.valid?
            request.errors.full_messages
        end
    end
end
