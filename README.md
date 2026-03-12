# Kubernetes Nginx Example

Этот проект демонстрирует развёртывание простого приложения (nginx) в minikube с помощью стандартных Kubernetes-манифестов: Deployment, Service, Ingress.

## Цель

Показать базовые навыки работы с Kubernetes: создание манифестов, управление ресурсами, настройка Ingress.

## Технологии

- minikube
- kubectl
- Kubernetes (Deployment, Service, Ingress)
- Docker / nginx

## Как использовать

### Предварительные требования

- Установленные [minikube](https://minikube.sigs.k8s.io/docs/start/), [kubectl](https://kubernetes.io/docs/tasks/tools/), Git.
- Виртуализация включена (для minikube).

### Развёртывание

1. Клонируйте репозиторий:

   ```bash
   git clone https://github.com/yourusername/k8s-nginx-example.git
   cd k8s-nginx-example
   ```
2. Запустите скрипт развертывания:

   ```
   ./scripts/deploy.sh
   ```

Или выполните шаги вручную:

```
minikube start
minikube addons enable ingress
kubectl apply -f k8s/
```

3. После развертывания добавьте запись в /etc/hosts (скрипт делает это автоматически):

   ```
   echo "$(minikube ip) nginx.local" | sudo tee -a /etc/hosts
   ```
4. Откройте браузер и перейдите по адресу `http://nginx.local`. Вы должны увидеть страницу приветствия nginx.
