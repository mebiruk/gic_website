class PagesController < ApplicationController
  def home
    @college = College.last
    @comment = VisitorComment.all
    @marketing = MarketingSection.all
    @news = News.all
    @programs = Program.all

    @admissions = Admission.all

    # analytics = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new
    # analytics.authorization = current_user.token # See: https://github.com/zquestz/omniauth-google-oauth2

    # date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
    # metric = Google::Apis::AnalyticsreportingV4::Metric.new(expression: 'ga:sessions', alias: 'sessions')
    # dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(name: 'ga:browser')

    # request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
    #   report_requests: [Google::Apis::AnalyticsreportingV4::ReportRequest.new(
    #     view_id: 'VIEW_ID_FROM_ANALYTICS_PROPERTY',
    #     metrics: [metric],
    #     dimensions: [dimension],
    #     date_ranges: [date_range]
    #   )]
    # ) # thanks to @9mm: https://github.com/google/google-api-ruby-client/issues/489

    # response = analytics.batch_get_reports(request)
    # response.reports

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
    @news = News.all
  end



  def accreditation
  	@accreditations = Accreditation.all
    @marketing = MarketingSection.all
  end
end
