
#### Subir o Registry

```html
docker-compose up -d -f docker-compose-registry.yml 
```

#### Subir o GitLab

```html
docker-compose up -d -f docker-compose-gitlab.yml 
```

#### Buildar as imagens da stack padrão

```html
docker-compose build 
docker-compose up -d -f docker-compose-gitlab.yml 
```

#### Subir a stack padrão

```html
docker-compose up
```
