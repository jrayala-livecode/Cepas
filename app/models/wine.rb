class Wine < ApplicationRecord
    
    has_many :wine_strains
    has_many :strains, through: :wine_strains
    has_many :wines, through: :scores
    
end


# wine.strains -> [] array con cepas
# strain.wines -> [] array con vinos

# wine.wine_strains -> [] asociaciones
# strain.wine_strains -> [] asociaciones

# wine_strain.strain -> obj cepa de la asociacion
# wine_strain.wine -> obj vino de la asociacion

# wine_strain.percent -> valor del atributo propio