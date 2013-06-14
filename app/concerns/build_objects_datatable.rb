class BuildObjectsDatatable
  delegate :params, :h, :image_tag, :link_to, :number_to_currency, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: BuildObject.count,
        iTotalDisplayRecords: products.count,
        aaData: data
      }
    end

  private

    def data
      products.map do |product|
        [
          link_to(product.name, product),
          number_to_currency(product.price)
        ]
      end
    end

    def products
      @products ||= fetch_products
    end

    def fetch_products
      build_objects = BuildObject.scoped.full
      unless params[:filter].blank?
        build_objects = build_objects.filter_country params[:filter][:country_id] unless params[:filter][:country_id].blank?
        build_objects = build_objects.filter_region params[:filter][:region_id] unless params[:filter][:region_id].blank?
        build_objects = build_objects.filter_city params[:filter][:city_id] unless params[:filter][:city_id].blank?
        build_objects = build_objects.filter_distinct params[:filter][:distinct_id] unless params[:filter][:distinct_id].blank?
        build_objects = build_objects.filter_street params[:filter][:street_id] unless params[:filter][:street_id].blank?
        build_objects = build_objects.filter_min_price params[:filter][:min_price] unless params[:filter][:min_price].blank?
        build_objects = build_objects.filter_max_price params[:filter][:max_price] unless params[:filter][:max_price].blank?
        build_objects = build_objects.filter_min_area params[:filter][:min_area] unless params[:filter][:min_area].blank?
        build_objects = build_objects.filter_max_area params[:filter][:max_area] unless params[:filter][:max_area].blank?
        build_objects = build_objects.filter_ipoteka params[:filter][:ipoteka] unless params[:filter][:ipoteka].blank?
      end
      products = build_objects
      # Product.order("#{sort_column} #{sort_direction}")
#       products = products.page(page).per_page(per_page)
#       if params[:sSearch].present?
#         products = products.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
#       end
      products
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[price]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
end