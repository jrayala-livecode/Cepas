class WinesController < ApplicationController
  before_action :authenticate_user!

    def index
        @wines = Wine.all.includes([:strains, :wine_strains])
        @wine = Wine.new
        @strains = Strain.all
    end
    
    def create
        @wine = Wine.new(wine_params) # crea instancia del vino

        strain_ids = params[:wine][:strain_ids] # recupera el array de ids de cepas
        strain_ids.delete("") unless strain_ids.nil? # limpia el array

        strain_percents = params[:wine][:strain_percent] # recupera el array de percentajes de cepas
        strain_percents.delete("") unless strain_percents.nil? # limpia el array

        # begin 

        #   Wine.transaction do
            
        #     @wine.save

        #     strain_ids.length.times do |i| # recorro n veces el array de ids que tiene el mismo largo que el de porcentajes

        #       WineStrain.create( # creo una relacion entre vinos y cepas
        #         wine_id: @wine.id, # asigno el id del vino a la relacion
        #         strain_id: strain_ids[i], # asigno el id de la cepa a la relacion
        #         percent: strain_percents[i] # aigno el porcentaje de la cepa a la relacion
        #       )

        #     end

        #     redirect_to root_path, notice: 'se ha guardado'
          
        #   end

        # rescue
        #   redirect_to root_path, alert: 'no se ha podido guardar'
        # end

        if @wine.save 

          unless strain_ids.nil?

            strain_ids.length.times do |i| # recorro n veces el array de ids que tiene el mismo largo que el de porcentajes

              WineStrain.create( # creo una relacion entre vinos y cepas
                wine_id: @wine.id, # asigno el id del vino a la relacion
                strain_id: strain_ids[i], # asigno el id de la cepa a la relacion
                percent: strain_percents[i] # aigno el porcentaje de la cepa a la relacion
              )

            end

          end

          flash[:success] = "Wine successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          redirect_to root_path
        end
    end
    
    private
    def wine_params
        params.require(:wine).permit(:name)
    end
end