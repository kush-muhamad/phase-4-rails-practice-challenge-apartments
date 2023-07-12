class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
     rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        tenants= Tenant.all
        render json:tenants
    end

    def create 
        tenants= Tenant.create!(tenant_params)
        render json:tenants, status: :created
    end

    def update
        tenants= find_tenant
       tenants.update(tenant_params)
        render json:tenants
    end

    def destroy
        tenants = find_tenant
       tenants.destroy
        head :no_content
    end


    private 
    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant
        tenants= Tenant.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)   
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
