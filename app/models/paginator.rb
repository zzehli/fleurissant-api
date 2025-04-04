module Paginator
  @content_per_page = 8

  def set_content_per_page(num)
    @content_per_page = num
  end
  # return desired page content calculated based on page number and content per page
  def page(page_number, per_page = @content_per_page)
    page_num ||= 1
    per_page ||= @content_per_page

    offset((page_num - 1) * per_page).limit(per_page)
  end
end
