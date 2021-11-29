class SubjectNeedHelpInsController < ApplicationController
  def index
    matching_subject_need_help_ins = SubjectNeedHelpIn.all

    @list_of_subject_need_help_ins = matching_subject_need_help_ins.order({ :created_at => :desc })

    render({ :template => "subject_need_help_ins/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subject_need_help_ins = SubjectNeedHelpIn.where({ :id => the_id })
    @list_of_all_subjects_user_needs_help_in=SubjectNeedHelpIn.where(:id=>the_id)

    @the_subject_need_help_in = matching_subject_need_help_ins.at(0)

    render({ :template => "subject_need_help_ins/show.html.erb" })
  end

  def create
    the_subject_need_help_in = SubjectNeedHelpIn.new
    the_subject_need_help_in.user_id = session.fetch(:user_id)
    user_course_num = params.fetch("query_subject_num").upcase
    exists_in_subject=Subject.where(:subject_course_num=>user_course_num).at(0)
    if exists_in_subject !=nil
      the_subject_need_help_in.subject_id = exists_in_subject.id
    else
      new_subject = Subject.new
      new_subject.subject_course_num = user_course_num.upcase
      new_subject.name = params.fetch("query_subject_name")
      new_subject.save
      the_subjects_need_help_in.subject_id = new_subject.id
    end
    #the_subject_need_help_in.subject_id = params.fetch("query_subject_num")

    if the_subject_need_help_in.valid?
      the_subject_need_help_in.save
      redirect_to("/subject_need_help_ins", { :notice => "Subject need help in created successfully." })
    else
      redirect_to("/subject_need_help_ins", { :notice => "Subject need help in failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subject_need_help_in = SubjectNeedHelpIn.where({ :id => the_id }).at(0)

    the_subject_need_help_in.user_id = params.fetch("query_user_id")
    the_subject_need_help_in.subject_id = params.fetch("query_subject_id")

    if the_subject_need_help_in.valid?
      the_subject_need_help_in.save
      redirect_to("/subject_need_help_ins/#{the_subject_need_help_in.id}", { :notice => "Subject need help in updated successfully."} )
    else
      redirect_to("/subject_need_help_ins/#{the_subject_need_help_in.id}", { :alert => "Subject need help in failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subject_need_help_in = SubjectNeedHelpIn.where({ :id => the_id }).at(0)

    the_subject_need_help_in.destroy

    redirect_to("/subject_need_help_ins", { :notice => "Subject need help in deleted successfully."} )
  end
end
