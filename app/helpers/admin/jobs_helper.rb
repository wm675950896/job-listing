module Admin::JobsHelper

  def render_job_status(job)
    if job.exist == "Y"
      content_tag(:span, "", :class => "fa fa-globe")
    else
      content_tag(:span, "", :class => "fa fa-lock")
    end
  end

end
