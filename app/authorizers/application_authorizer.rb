# Other authorizers should subclass this one
class ApplicationAuthorizer < Authority::Authorizer
  # :admin 권한을 가진 사용자는 모든 권한
  def self.default(adjective, user)
    user.has_role? :admin
  end

  # :admin 권한이 있거나 :author 권한을 부여받은 경우 본인이 작성한 리소스만 수정가능
  def updatable_by?(user)
    (user.has_role?(:author) && resource.user == user) || user.has_role?(:admin)
  end

  # :admin 권한이 있거나 :author 권한을 부여받은 경우 본인이 작성한 리소스만 삭제가능
  def deletable_by?(user)
    (user.has_role?(:author) && resource.user == user) || user.has_role?(:admin)
  end
end
