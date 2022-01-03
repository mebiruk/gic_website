class PagesController < ApplicationController
  def home
    @college = College.last
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = News.all
    @programs = Program.all
    @admissions = Admission.all
  end

  def contact
  end

  def about
  	@college = College.last
    @staff = Staff.all
    @service = Service.all
    @accreditations = Accreditation.all
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = @news = News.order('created_at DESC').last(6)
  end

  def accreditation
  	@accreditations = Accreditation.all
    @marketing = MarketingSection.all
  end
end
