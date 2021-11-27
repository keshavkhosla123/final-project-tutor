class SubjectsCanTeachesController < ApplicationController
  def index
    matching_subjects_can_teaches = SubjectsCanTeach.all

    @list_of_subjects_can_teaches = matching_subjects_can_teaches.order({ :created_at => :desc })

    render({ :template => "subjects_can_teaches/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subjects_can_teaches = SubjectsCanTeach.where({ :id => the_id })

    @the_subjects_can_teach = matching_subjects_can_teaches.at(0)
    @user_id = @the_subjects_can_teach.user.id

    @list_of_subjects_user_teaches = SubjectsCanTeach.where({:user_id=>@user_id})
    @subs = Array.new
    @list_of_subjects_user_teaches.each do |inst|
      subj=inst.subject_id
      @subs.push(subj)
    end
    @subs_names=Array.new
    @subs.each do |id|
      name=Subject.where(:id=>id).at(0).name
      @subs_names.push(name)
    end


    render({ :template => "subjects_can_teaches/show.html.erb" })
  end

  def create
    the_subjects_can_teach = SubjectsCanTeach.new
    the_subjects_can_teach.user_id = session.fetch(:user_id)
    the_subjects_can_teach.subject_id = params.fetch("query_subject_subject_id")
    #the_subjects_can_teach.subject_course_num = params.fetch("query_subject_course_num")

    if the_subjects_can_teach.valid?
      the_subjects_can_teach.save
      redirect_to("/subjects_can_teaches", { :notice => "Subjects can teach created successfully." })
    else
      redirect_to("/subjects_can_teaches", { :notice => "Subjects can teach failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subjects_can_teach = SubjectsCanTeach.where({ :id => the_id }).at(0)

    the_subjects_can_teach.user_id = params.fetch("query_user_id")
    the_subjects_can_teach.subject_id = params.fetch("query_subject_id")
    the_subjects_can_teach.subject_course_num = params.fetch("query_subject_course_num")

    if the_subjects_can_teach.valid?
      the_subjects_can_teach.save
      redirect_to("/subjects_can_teaches/#{the_subjects_can_teach.id}", { :notice => "Subjects can teach updated successfully."} )
    else
      redirect_to("/subjects_can_teaches/#{the_subjects_can_teach.id}", { :alert => "Subjects can teach failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subjects_can_teach = SubjectsCanTeach.where({ :id => the_id }).at(0)

    the_subjects_can_teach.destroy

    redirect_to("/subjects_can_teaches", { :notice => "Subjects can teach deleted successfully."} )
  end
end
