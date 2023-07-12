class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
     rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    

    def create 
        leases = Lease.create!(lease_params)
        render json:leases, status: :created
    end


    def destroy
        leases = find_lease
       leases.destroy
        head :no_content
    end


    private 
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def find_lease
        leases= Lease.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Lease not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)   
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
