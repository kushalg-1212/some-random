    gitlab_rails['ldap_enabled'] = true

    ###! **remember to close this block with 'EOS' below**
    gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
     main: # 'main' is the GitLab 'provider ID' of this LDAP server
      label: 'Active Directory Login'
      host: 'drdc.domain.com'
      port: 389
      uid: 'sAMAccountName'
      method: 'plain' # "tls" or "ssl" or "plain"
      bind_dn: 'CN=Ldap Search,OU=All Accounts,DC=domain,DC=com'
      password: '12345678'
      active_directory: true
      allow_username_or_email_login: false
      block_auto_created_users: false
      base: 'OU=All Users,DC=domain,DC=com'
      timeout: 10
      user_filter: '(memberOf=CN=Gitlab Users,OU=All User Groups,DC=domain,DC=com)'
    EOS
