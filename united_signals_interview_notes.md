
# United Signals Project – Interview Notes

## 🌐 Project Overview
**Company**: United Signals GmbH (Germany)  
**Industry**: Fintech / SaaS / Process Automation  
**Tech Stack**: Ruby on Rails, React, PostgreSQL, Redis, Sidekiq, Docker, AWS

United Signals provides a platform to digitize and automate paper-based business processes for banks, insurers, and public sector clients. I worked primarily on the **Onboarding** module and the **Business Control Center (BCC)**.

---

## ✅ Onboarding Module

### 🎯 Purpose
Digitally onboard clients in a paperless manner including data collection, document generation, KYC, and contract signing.

### 🔧 Key Contributions
- Dynamic form rendering using configuration-driven JSON schemas.
- Multi-step wizard flow with validations and conditional logic.
- Integrated KYC providers like IDnow via REST APIs with Sidekiq background jobs.
- Built contract data generators with ISO3166 mapping and dynamic PDF generation.
- Implemented GDPR-compliant audit logging of onboarding events.

### 🧠 Technical Highlights
- Used inheritance-based architecture for tenant-specific customization.
- Event-driven processing of KYC callbacks to update onboarding status in real-time.
- Fully test-covered using RSpec and request specs.

---

## 📊 Business Control Center (BCC)

### 🎯 Purpose
Internal admin dashboard to manage tenants, monitor onboarding, and control business features.

### 🔧 Key Contributions
- Real-time onboarding dashboard with ActionCable for live updates.
- Impersonation tools for support teams (with audit logging).
- Feature toggle system to enable/disable tenant-specific configurations.
- Admin panel for tenant settings, contract templates, and document management.

### 🧠 Technical Highlights
- Used policy-based access (Pundit) to enforce RBAC at both controller and view level.
- Modular config editor for tenant feature flags and flow customizations.

---

## 🔐 Role-Based Access Control (RBAC)

### 🔧 Implementation
- Roles: Global Admin, Tenant Admin, Support Agent, End User.
- Scoped access using Pundit policy classes per model.
- Frontend feature visibility controlled via role-based flags.
- All impersonation and critical actions logged with metadata.

### 🧩 Example
> Bank A’s support agent should not access Bank B’s users.  
> Solved using `user.tenant_id` checks in policies and DB queries.

```ruby
class OnboardingPolicy < ApplicationPolicy
  def show?
    user.global_admin? || (user.tenant_admin? && record.tenant_id == user.tenant_id)
  end
end
```

---

## 🏆 Business Impact
- Enabled fully digital onboarding for 10+ financial institutions.
- Reduced onboarding time by 60–80% through automation.
- Gave business teams full visibility and control via BCC.
- We have nfs folder which is common between the clusters

---

## 💬 Sample Summary for Interviews

> “I contributed to the onboarding and BCC modules of United Signals’ digital platform. I implemented dynamic, tenant-configurable onboarding workflows with KYC integration and contract generation. I also built admin tools for monitoring and managing onboarding pipelines and implemented a robust RBAC system using Pundit. These solutions reduced onboarding time and improved operational control across multiple partner banks.”
