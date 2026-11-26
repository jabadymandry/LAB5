## Installer terraform
```
cat <<'EOF' > ~/.customize_environment
# Set up HashiCorp repository and install Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform
EOF
bash ~/.customize_environment
```

## 1- Créer la structure du module avec la commande:
```
mkdir -p modules/{instances,storage} && \
touch main.tf variables.tf outputs.tf \
modules/instances/{instances.tf,outputs.tf,variables.tf} \
modules/storage/{storage.tf,outputs.tf,variables.tf}
```

## 2- Copier et coller le contenu de chaque fichier


## 
```
$ terraform import google_compute_instance.default projects/{{project}}/zones/{{zone}}/instances/{{name}}
$ terraform import google_compute_instance.default {{project}}/{{zone}}/{{name}}
$ terraform import google_compute_instance.default {{name}}
```

projects/{{GOOGLE_CLOUD_PROJECT}}/zones/{{ZONE}}/instances/tf-instance-1