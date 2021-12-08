class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end

  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end


  def show_details
    render(:template=>"homepage/user_details.html.erb")
  end

  def index_homepage
    if session.fetch(:user_id) == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    else




    the_user_id = session.fetch(:user_id)
    @the_user = User.where(:id=>the_user_id).at(0)
    @the_subjects_user_teaches = SubjectsCanTeach.where(:user_id=>the_user_id)
    @list_of_subjects = Array.new
    @the_subjects_user_teaches.each do |a_subject|
      subj = a_subject.subject
      @list_of_subjects.push(subj)
    end
    #subjects user can teach
    @total_info = Array.new
    new_info = Array.new
    @list_of_subjects.each do |a_subj|
      users_who_need_help = SubjectNeedHelpIn.where(:subject_id=>a_subj.id)
      if users_who_need_help != nil
        users_who_need_help.each do |a_user|
          new_info.push(a_user.user_id)
          new_info.push(a_subj.id)
          subject_need_help_in_id_and_user = SubjectNeedHelpIn.where(:subject_id=>a_subj.id).where(:user_id=>a_user.user_id).at(0)
          new_info.push(subject_need_help_in_id_and_user)
          @total_info.push(new_info)
          new_info = []
        end
      end
    end

      @all_info=Array.new
      new_info2 = Array.new
      @total_info.each do |a_tup|
        x=a_tup.at(0)
        the_user = User.where(:id=>x).at(0)
        the_user_name = the_user.first_name + " " + the_user.last_name
        new_info2.push(the_user_name)
        y=a_tup.at(1)
        the_subject = Subject.where(:id=>y).at(0)
        the_subject_name = the_subject.name
        the_subject_num = the_subject.subject_course_num
        new_info2.push(the_subject_name)
        new_info2.push(the_subject_num)
        new_info2.push(x)
        new_info2.push(a_tup.at(2).id)
        @all_info.push(new_info2)
        new_info2=[]

      end
    @the_subjects_user_needs_help_in = SubjectNeedHelpIn.where(:user_id=>the_user_id)
    @list_of_subjects2 = Array.new
    @the_subjects_user_needs_help_in.each do |a_sub|
      @list_of_subjects2.push(a_sub.subject)
    end
    @total_info2 = Array.new
    @new_info3 = Array.new
    @list_of_subjects2.each do |a_subj|
      users_who_teach = SubjectsCanTeach.where(:subject_id => a_subj.id)
      if users_who_teach != nil
        users_who_teach.each do |a_user|
          @new_info3.push(a_user.user_id)
          @new_info3.push(a_subj.id)
          subject_can_teach_id_and_user = SubjectsCanTeach.where(:subject_id=>a_subj.id).where(:user_id=>a_user.user_id).at(0)
          @new_info3.push(subject_can_teach_id_and_user)
          @total_info2.push(@new_info3)
          @new_info3=[]
        end
      end
    end
    @all_info2 = Array.new
    new_info4 = Array.new
    @total_info2.each do |a_tup|
      if a_tup.at(0) !=nil
        z=a_tup.at(0)
        the_user2 = User.where(:id=>z).at(0)
        the_user_name2 = the_user2.first_name + " " + the_user2.last_name
        new_info4.push(the_user_name2)
        a=a_tup.at(1)
        the_subject2 = Subject.where(:id=>a).at(0)
        the_subject_name2 = the_subject2.name
        the_subject_num2 = the_subject2.subject_course_num
        new_info4.push(the_subject_name2)
        new_info4.push(the_subject_num2)
        new_info4.push(z)
        new_info4.push(a_tup.at(2).id)
        @all_info2.push(new_info4)
        new_info4=[]
      end
    end

    render(:template=>"homepage/show.html.erb")
    end
  end


  def post_comment
    posting_user = session.fetch(:user_id)
    reviwed_user = params.fetch("reviewed_user_id_box")
    redirect_id = params.fetch("redirect_id")
    comment = params.fetch("query_comment")
    new_comment = Comment.new
    new_comment.body = comment
    new_comment.reviewed_id = reviwed_user
    new_comment.user_id = posting_user
    new_comment.save
    
    redirect_to("/subjects_can_teaches/#{redirect_id}")
  end

  def post_comment2
    posting_user = session.fetch(:user_id)
    reviwed_user = params.fetch("reviewed_user_id_box")
    redirect_id = params.fetch("redirect_id")
    comment = params.fetch("query_comment")
    new_comment = Comment.new
    new_comment.body = comment
    new_comment.reviewed_id = reviwed_user
    new_comment.user_id = posting_user
    new_comment.save
    
    redirect_to("/subject_need_help_ins/#{redirect_id}")
  end

end
