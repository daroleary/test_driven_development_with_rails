class NewAchievementForm
  include Capybara::DSL

  def visit_page
    visit('/')
    click_on('New Achievement')
    self
  end

  def fill_in_with(params = {})
    fill_in('Title', with: params.fetch(:title, 'Read a book'))
    fill_in('Description', with: params.fetch(:description, 'Excellent read'))
    select('Public', from: params.fetch(:privacy, 'Privacy'))
    check(params.fetch(:featured, 'Featured achievement'))
    attach_file('Cover image', params.fetch(:cover_image, "#{Rails.root}/spec/fixtures/cover_image.png"))
    self
  end

  def submit
    click_on('Create Achievement')
    self
  end
end