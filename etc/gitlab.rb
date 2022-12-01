    gitlab_rails['ldap_enabled'] = true

    ###! **remember to close this block with 'EOS' below**
    gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
     main: # 'main' is the GitLab 'provider ID' of this LDAP server
      label: 'Active Directory Login'
      host: '.com'
      port: 389
      uid: 'sAMAccountName'
      method: 'plain' # "tls" or "ssl" or "plain"
      bind_dn: 'CN=Ldap Search,OU=MAIN,DC=tracio,DC=com'
      password: ''
      active_directory: true
      allow_username_or_email_login: false
      block_auto_created_users: false
      base: 'OU=MAIN,DC=tracio,DC=com'
      timeout: 10
      user_filter: '(memberOf=CN=,OU=,DC=,DC=com)'
    EOS
