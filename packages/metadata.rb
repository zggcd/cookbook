name        "packages"
description "Helper library to determine whether distribution-only packages are installed"
maintainer  "AWS OpsWorks"
maintainer_email "devops@spiralwks.com"
license     "Apache 2.0"
version     "1.0.0"

attribute "packages",
  :display_name => "Packages",
  :description => "Hash of Packages attributes",
  :type => "hash"

attribute "packages/dist_only",
  :display_name => "Packages Distribution Only?",
  :description => "Set to only use distribution-provided packages",
  :default => "false"

