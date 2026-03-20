Aquí está la información enfocada para esa audiencia:

---

## Clasify — Plataforma de tutorías particulares | Proyecto personal full-stack

**Ciudad piloto:** Guayaquil, Ecuador
`gitlab.com/web-deployhero/clasify-api` · `gitlab.com/web-deployhero/clasify-ui`

---

### ¿Qué es Clasify?

Marketplace de profesores particulares que conecta tutores con estudiantes. Un profesor puede registrarse, verificar su perfil, publicar su disponibilidad y materias, y recibir reservas de clases. Un estudiante puede buscar profesores, reservar clases y dejar reseñas. La plataforma incluye un modelo de suscripción por niveles (Free / Starter / Pro) para los profesores.

---

### Stack

| Capa | Tecnologías |
|------|-------------|
| Backend | .NET 10, ASP.NET Core Web API, Clean Architecture, EF Core |
| Base de datos | PostgreSQL 18 + pgvector |
| Cache / Auth | Redis 8.6.1, JWT Bearer + refresh tokens |
| Frontend | Blazor Server (.NET 10) |
| Infraestructura | Podman (pods, volumes, networks) |
| Testing | xUnit (unit + integration tests) |

---

### Backend — Clasify API

**Arquitectura:** Clean Architecture en 4 capas (`Domain`, `Application`, `Infrastructure`, `API`).

**Decisiones de diseño destacadas:**
- Modelo `Person`-céntrico: una sola entidad por persona física que puede tener simultáneamente los roles `Teacher` y `Student` mediante `[Flags]` enum, evitando duplicidad de datos.
- Verificación de profesores por admin (`VerificationStatus`: Pending → UnderReview → Verified / Rejected) antes de aparecer en el marketplace.
- Suscripciones por niveles (Free / Starter / Pro) que controlan el acceso a funcionalidades del profesor.

**Autenticación y seguridad:**
- JWT Bearer con access tokens de 15 min y refresh tokens de 7 días con rotación.
- Logout real mediante blocklist `jti` en Redis — el token queda invalidado aunque no haya expirado.
- Hashing de contraseñas con PBKDF2.
- Autorización basada en roles (`Admin`, `Teacher`, `Student`) por endpoint.

**Recursos REST implementados:**
Auth, Teachers, Students, Subjects, Bookings, Reviews, Teacher Availability, Teacher Subjects, Subscriptions — con soft delete, paginación y filtros.

---

### Frontend — Clasify UI

**Framework:** Blazor Server (.NET 10, Interactive Server Rendering).

**Implementación:**
- `HttpClient` tipado (`ApiClient`) con `AuthorizationMessageHandler` que adjunta el JWT en cada request.
- `JwtAuthenticationStateProvider` personalizado que decodifica el JWT y expone los claims al sistema de autorización de Blazor.
- `TokenStorageService` para persistencia de tokens en el navegador.
- Flujos completos implementados: registro, login, creación y edición de perfil de profesor, gestión de disponibilidad y materias, reservas, reseñas y suscripciones.

**Páginas públicas:** Home, listado de profesores, perfil público del profesor, materias.
**Páginas autenticadas (Teacher):** Dashboard, bookings, reviews, disponibilidad, materias, suscripción.

---

### Infraestructura local

Entorno reproducible con Podman: dos pods independientes (`clasify-postgres-pod`, `clasify-redis-pod`) en una red dedicada `clasify-network`, levantados con un único script (`podman-setup.sh`). Datos persistidos en named volumes.

---

¿Lo exporto como `.docx`, `.pdf` o `.md`?