module Paginator
  @content_per_page = 8

  def set_content_per_page(num)
    @content_per_page = num
  end
  # return desired page content calculated based on page number and content per page
  def page(page, limit = @content_per_page)
    page ||= 1
    limit ||= @content_per_page

    offset((page - 1) * limit).limit(limit)
  end
end
