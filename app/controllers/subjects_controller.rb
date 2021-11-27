class SubjectsController < ApplicationController
  def index
    matching_subjects = Subject.all

    @list_of_subjects = matching_subjects.order({ :created_at => :desc })

    render({ :template => "subjects/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subjects = Subject.where({ :id => the_id })

    @the_subject = matching_subjects.at(0)

    render({ :template => "subjects/show.html.erb" })
  end

  def create
    the_subject = Subject.new
    the_subject.subject_course_num = params.fetch("query_subject_course_num")
    the_subject.name = params.fetch("query_name")
    the_subject.prof_name = params.fetch("query_prof_name")

    if the_subject.valid?
      the_subject.save
      redirect_to("/subjects", { :notice => "Subject created successfully." })
    else
      redirect_to("/subjects", { :notice => "Subject failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subject = Subject.where({ :id => the_id }).at(0)

    the_subject.subject_course_num = params.fetch("query_subject_course_num")
    the_subject.name = params.fetch("query_name")
    the_subject.prof_name = params.fetch("query_prof_name")

    if the_subject.valid?
      the_subject.save
      redirect_to("/subjects/#{the_subject.id}", { :notice => "Subject updated successfully."} )
    else
      redirect_to("/subjects/#{the_subject.id}", { :alert => "Subject failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subject = Subject.where({ :id => the_id }).at(0)

    the_subject.destroy

    redirect_to("/subjects", { :notice => "Subject deleted successfully."} )
  end
end
