module ProductsHelper

	def link_to_add_features(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |fields_for_form|
	      render("products/" + association.to_s.singularize + "_fields", ftr: fields_for_form)
	    end
	    link_to(name, '', class: "add_fields btn-flat btn-add-fields", data: { id: id, fields: fields.gsub("\n", "")})
	end

	def link_to_generate_skus(name, f, association)
		new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |fields_for_form|
	      render("products/" + association.to_s.singularize + "_fields", sku: fields_for_form)
	    end

	    link_to(name, '', class: "generate_sku btn-flat btn-generate", data: { id: id, fields: fields.gsub("\n", "")})
	end

	def feature_value_div(f, value_obj)
		new_object = f.object.send(value_obj).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(value_obj, new_object, child_index: id) do |fields_for_form|
	      render("products/" + value_obj.to_s.singularize + "_fields", val: fields_for_form)
	    end

	    content_tag(:div, "<!-- Hidden Data -->", class: ["feature_value_regex", "hidden"], data: { id: id, spanval: 'spanval', fields: fields.gsub("\n", "")})
	end

end
