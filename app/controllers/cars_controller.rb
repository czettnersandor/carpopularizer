class CarsController < ApplicationController
  
  def index

    @cars = Car.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params))
  end

  protected
  def gen_conditions(parameters)
    conds = []
    condvals = []
    columns = Car.column_names
    parameters.each do |k, v|
      ks = k.to_s
      if columns.include? ks

        col = Car.columns_hash[ks]
        case col.type
        when :string
          conds << " #{k} like ? "
          condvals << "%#{v}%"
        when :integer
          if v != ""
            conds << " #{k} = ? "
            condvals << v.to_i
          end
        when :float
          if v != ""
            conds << " #{k} = ? "
            condvals << v == v.to_f
          end
        end

      end
    end

    return [conds.join(' and '), *condvals]

  end

end
