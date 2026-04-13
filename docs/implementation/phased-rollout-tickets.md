# Phased Implementation Tickets (API-first + staged rollout)

## Rollout guardrails (applies to all phases)

- **Delivery order:** ship Laravel API contracts first (request/response + validation + auth policy), then wire frontend/mobile feature flags, then enable flags gradually.
- **Flag strategy:** each phase gets a global kill-switch plus per-surface flags (`web`, `mobile`) to support canary rollout.
- **Versioning:** add all new endpoints under existing API namespace with explicit versioning (`/api/v1/...`) and non-breaking response envelopes.
- **Observability:** every ticket should include logging, metrics, and error tracking additions before production rollout.

---

## Phase 1 — Geo-location service feed + nearest listings

### Ticket P1-1: API contract for geo feed + nearest listings (Laravel)
**Scope**
- Define endpoint contracts:
  - `GET /api/v1/geo/feed`
  - `GET /api/v1/listings/nearest`
- Request params: `lat`, `lng`, `radius_km`, `limit`, optional `category_id`.
- Response contract includes distance, listing metadata, and service availability status.
- Add request validation + standardized API error shape for invalid/absent coordinates.

**Acceptance criteria**
- OpenAPI/contract doc committed with example request/response payloads.
- Contract tests verify schema shape, pagination, and validation errors.
- Endpoint returns deterministic ordering by distance, then listing score.

### Ticket P1-2: Backend implementation for nearest-listing query
**Scope**
- Implement geo-distance query (DB-level where possible).
- Add index/migration support for geospatial lookup or fallback approximation strategy.
- Add caching rules for hot locations (short TTL).

**Acceptance criteria**
- P95 response target defined and measured in staging.
- Unit/integration tests cover radius filters and edge coordinates.

### Ticket P1-3: Web + mobile feature flags for geo discovery
**Scope**
- Add flags:
  - `geo_feed_enabled`
  - `nearest_listings_enabled`
  - surface overrides: `geo_feed_web_enabled`, `geo_feed_mobile_enabled`
- Gate UI entry points and API calls behind flags.
- Add fallback UX when flag is off (existing discovery/list view).

**Acceptance criteria**
- With flags OFF, no geo API calls are made.
- With flags ON, feature works for enabled platform only.

---

## Phase 2 — QR scan entry points for payments/offers in mobile app

### Ticket P2-1: API contracts for QR payload resolution + action intents (Laravel)
**Scope**
- Define contracts:
  - `POST /api/v1/qr/resolve`
  - `POST /api/v1/qr/actions/payment`
  - `POST /api/v1/qr/actions/offer-redeem`
- Contract supports signed/expiring QR payloads, merchant context, and idempotency keys.
- Standardize failure reasons (`EXPIRED`, `INVALID_SIGNATURE`, `ALREADY_REDEEMED`, etc.).

**Acceptance criteria**
- Contract docs include success/failure examples for each QR type.
- Request validation and authorization policies enforced.

### Ticket P2-2: Mobile scanner integration + deep entry routing
**Scope**
- Add scanner entry points in mobile app for wallet/offers/payments modules.
- Route resolved QR intents to the correct confirmation flow.
- Handle camera permission denied/retry UX.

**Acceptance criteria**
- End-to-end flow validated for payment QR and offer QR.
- Scanner errors mapped to user-friendly messages.

### Ticket P2-3: Feature flags for QR actions (mobile/web-safe)
**Scope**
- Add flags:
  - `qr_scan_enabled`
  - `qr_payment_enabled`
  - `qr_offer_redeem_enabled`
- Keep web-safe fallback path disabled by default if scanner is mobile-only.

**Acceptance criteria**
- Flags can disable individual QR actions without removing scanner shell.
- Audit logs capture QR action attempts and outcomes.

---

## Phase 3 — Subscription/pro membership plans + entitlement checks

### Ticket P3-1: API contracts for plans, subscription state, and entitlements (Laravel)
**Scope**
- Define contracts:
  - `GET /api/v1/subscriptions/plans`
  - `GET /api/v1/subscriptions/me`
  - `POST /api/v1/subscriptions/checkout`
  - `GET /api/v1/entitlements/me`
- Contract includes plan tiers, billing cycle, trial metadata, and entitlement list.
- Add webhook contract(s) for payment provider events.

**Acceptance criteria**
- Entitlement contract stable and consumable by web + mobile.
- Contract tests verify transitions (`active`, `past_due`, `canceled`, `trialing`).

### Ticket P3-2: Backend entitlement middleware + guard checks
**Scope**
- Add reusable entitlement policy middleware for protected endpoints/features.
- Map features to required entitlements in config.
- Add admin-safe override tooling for support operations.

**Acceptance criteria**
- Protected APIs return consistent `403` contract when entitlement missing.
- Entitlement checks are covered by integration tests.

### Ticket P3-3: Frontend/mobile paywall + flags
**Scope**
- Add flags:
  - `subscriptions_enabled`
  - `pro_entitlements_enforced`
  - `paywall_ui_enabled_web`
  - `paywall_ui_enabled_mobile`
- Show gated UI only when relevant flags + entitlement state require it.

**Acceptance criteria**
- Flag-off mode keeps legacy access behavior unchanged.
- Flag-on mode enforces paywall according to entitlement response.

---

## Phase 4 — AI helper endpoint + lightweight chat UI on web/mobile

### Ticket P4-1: API contract for AI helper endpoint (Laravel)
**Scope**
- Define contracts:
  - `POST /api/v1/ai/helper/chat`
  - optional `GET /api/v1/ai/helper/suggestions`
- Request includes conversation context, user locale, and optional listing context.
- Response envelope includes answer text, suggested actions, and confidence/safety metadata.
- Add usage quotas + abuse controls in contract.

**Acceptance criteria**
- API contract includes redaction/privacy notes for logged prompts.
- Contract tests cover rate limits, unsafe prompt handling, and malformed context.

### Ticket P4-2: Web + mobile lightweight chat UI
**Scope**
- Add minimal assistant launcher + chat thread component on web and mobile.
- Support canned prompts and contextual handoff to listings/offers/subscription pages.
- Handle loading, retries, and graceful degradation when AI unavailable.

**Acceptance criteria**
- UI remains non-blocking and can be hidden with flags.
- Telemetry tracks opens, sends, failures, and handoff click-through.

### Ticket P4-3: Feature flags for AI helper rollout
**Scope**
- Add flags:
  - `ai_helper_enabled`
  - `ai_helper_web_enabled`
  - `ai_helper_mobile_enabled`
  - `ai_helper_internal_only`
- Support staged rollout cohorts (internal -> beta -> public).

**Acceptance criteria**
- Internal-only flag restricts visibility by user cohort.
- Kill-switch disables helper across all clients within one config refresh.

---

## Cross-phase execution sequence

1. **Contract first:** implement/approve Laravel API contracts + tests for the phase.
2. **Backend logic:** add implementation behind server-side feature toggles.
3. **Client gating:** wire frontend/mobile flags and fallback UX.
4. **Staged enablement:** internal users -> small cohort -> region/platform ramp -> full rollout.
5. **Post-launch hardening:** tune monitoring thresholds and rollback playbook.

## Suggested tracking labels

- `phase-1`, `phase-2`, `phase-3`, `phase-4`
- `api-contract`, `backend`, `web`, `mobile`, `feature-flag`, `rollout`, `observability`
