module KblosHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_kblos_path
    elsif action_name == 'edit'
      kblo_path
    end
  end
end
