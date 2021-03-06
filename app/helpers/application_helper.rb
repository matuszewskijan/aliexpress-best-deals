module ApplicationHelper
  # used to generate lines with random colors on homepage
  def random_colors
    colors = ["#f1c40f", "#16a085", "#e74c3c", "#8e44ad", "#34495e", "#87D37C", "#F89406", "#F62459", "#03C9A9"]
    colors[rand(0..colors.length - 1)]
  end

  def pretty_url_encode(url)
    for i in 0..url.length - 1
      url[i] = "^%" if url[i] == "-"
      url[i] = "-" if url[i] == " "
      url[i] = "%^" if url[i] == "."
    end
    return url
  end

  def pretty_url_decode(url)
    for i in 0..url.length - 1
      url[i] = " " if url[i] == "-"

      if url[i] == "^" && url[i + 1] == "%"
        url[i] = "-"
        url[i + 1] = "" if i + 1 < url.length
      end

      if url[i] == "%" && url[i + 1] == "^"
        url[i] = "."
        url[i + 1] = "" if i + 1 < url.length
      end
    end
    return url
  end

  def print_multiline(field)
    field.gsub("\r\n", "<br/>").html_safe
  end

  def is_admin?
    return true if Rails.env.test?
    return true if current_user && current_user.is_admin == 'y'
    flash[:notice] = "You must be an admin to access this page!"
    redirect_to root_path && return
  end

end
