#!/usr/bin/env python3
# -*- coding: utf8 -*-

"""

A script for usage with Ansible Vault and pass (https://www.passwordstore.org)
to keep vault passwords in encrypted passwordstore.

To use gopass (https://www.gopass.pw) instead pass just change a line
proc = Popen(['pass', passwordstore], stdout=PIPE, stderr=PIPE)
to
proc = Popen(['gopass', passwordstore], stdout=PIPE, stderr=PIPE)
or create alias for your login shell or symlink 'pass' to 'gopass' executable.


This script MUST be saved with executable permissions.

You can set ANSIBLE_VAULT_PASSWORD_FILE=/path/to/ansible-vault-pass-client.py
environment variable or use --vault-password-file CLI option.

Also you can add to 'vault_password_file' option to [defaults] section of the
Ansible config file (ansible.cfg):

[defaults]
vault_password_file = /path/to/ansible-vault-pass-client.py


To configure default passwordstore for vault password add new section in your
ansible.cfg:

[vault]
passwordstore = ansible/prod

Single script may return different vault passwords. To use this feature, script
file must have a name that ends with -client suffix.
CLI option --vault-id sets desired 'passwordstore' name.

ansible-playbook \
        --vault-id ansible/dev@/path/to/ansible-vault-pass-client.py site.yml

If vault-id not set or vault-id=default script will search for passwordstore
name in the Ansible config file.

"""

from argparse import ArgumentParser as AP
from subprocess import PIPE, Popen
from sys import exit, stderr, stdout

from ansible.config.manager import ConfigManager, get_ini_config_value


def get_vault_id():
    # Get passwordstore name from '--vault-id' CLI option
    parser = AP(description='Get a vault password from passwordstore')

    parser.add_argument('--vault-id', action='store', default='default',
                        dest='vault_id',
                        help='passwordstore containing the vault password')

    vault_id = parser.parse_args().vault_id.strip()

    return vault_id


def get_config_passwordstore():
    # Get passwordstore name from Ansible config
    ansible_config = ConfigManager()
    passwordstore = get_ini_config_value(
        ansible_config._parsers[ansible_config._config_file],
        dict(section='vault', key='passwordstore')
    ) or None

    return passwordstore


def main():
    vault_id = get_vault_id()
    if (vault_id != 'default' and vault_id != ""):
        passwordstore = vault_id
    else:
        passwordstore = get_config_passwordstore()

    if passwordstore:
        # Get vault password from passwordstore
        proc = Popen(['pass', passwordstore], stdout=PIPE, stderr=PIPE)
        output = proc.communicate()[0].decode('utf-8').strip().split("\n")[0]
        stdout.write(output)
        exit(0)
    else:
        stderr.write('Could not find passwordstore settings in Ansible '
                     'config!\nPlease read the info in this script header.\n')
        exit(1)


if __name__ == '__main__':
    main()
