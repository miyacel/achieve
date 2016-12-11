module BlogsHelper
  def blog_choose_new_or_comfirm
    if action_name == 'new' || action_name == 'confirm'
      confirm_blogs_path
    elsif action_name == 'edit'
      blogs_path
    end
  end
end
