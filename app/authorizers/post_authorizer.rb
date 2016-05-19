class PostAuthorizer < ApplicationAuthorizer

  # :author 혹은 :admin 권한을 가진 사용자만 작성가능
  def self.creatable_by?(user)
    user.has_role?(:author) || user.has_role?(:admin)
  end
end