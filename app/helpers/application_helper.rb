module ApplicationHelper

  def get_host_without_www(url)
    begin
      uri = URI.parse(url)
      uri = URI.parse("http://#{url}") if uri.scheme.nil?
      host = uri.host.downcase
      host.start_with?('www.') ? host[4..-1] : host
    rescue
      "Invalid url"
    end
  end

  def h_link(object)
    return link_to object.identify, object
  end
  
  def apply_chain_link_or_print(functions, object)
    # debugger
    
    e = recusive_function_chainer(functions, object)

    puts "e: #{e}"
    puts "functions: #{functions}"
    puts "object: #{object}"

    if functions == [:identify]
      return link_to e, object
    end

    if e.nil?
      return "nil"
    elsif String >= e.class
      return e.to_s
    elsif Numeric >= e.class
      return e
    elsif Array >= e.class
      if e.empty?
        return "none"
      end

      r = e.map{|ee| 
        if ee.nil?
          "nil"
        else
           link_to ee.identify, ee
        end
      }

      if can? :write, e.first.class.to_s.tableize
        r << ( link_to "Create a new #{e.first.class}", action: :new, controller: e.first.class.to_s.tableize)
      end
      
      return r.join('<br>')
    else
      begin
        return link_to e.identify, e
      rescue 
        return "Cold not create a field for #{e.to_s}"
      end
    end
  end

  def recusive_function_chainer(chain, element)
    puts "recusive_function_chainer: #{chain.inspect}, #{element}"

    e = element

    # for every operation in the chain
    [*chain].each do |link|
      if e.kind_of? Array
        puts "e is array"
        e = e.map{|ee| recusive_function_chainer(link, ee)}
      else
        puts "e is NOT array"
        e = e.try(link)
      end
    end

    return e
  end

  def link_to_add_fields(name, f, association)
    puts "link_to_add_fields( #{name}, #{f}, #{association.inspect}"

    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      field_to_render = association.to_s.singularize + "_fields"
      puts "FIELD TO RENDER: #{field_to_render}"
      render(field_to_render, f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  # def current_user
  #   @current_user ||= user_from_remember_token
  # end
end
