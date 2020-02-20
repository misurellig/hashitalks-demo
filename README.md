# hashitalks-demo

This repo contains an example on how to use [Vault reponse wrapping](https://www.vaultproject.io/docs/concepts/response-wrapping/) feature to fetch Vault secrets from a Jenkins pipeline.

The example has been used during the [HashiTalks2020](https://events.hashicorp.com/hashitalks2020) "Vault Response Wrapping Makes Secret Zero Challenge A Piece Of Cake" presentation demo.

## terraform folder

Terraform configuration files to configure both the Jenkins pipeline AppRole and the wrapping policy.

## Jenkinsfile

Stages simplify the following workflow:

![Vault Response Wrapping Jenkins Workflow](/images/vault-jenkins-response-wrapping.png)

