-- Enable UUID extension
create extension if not exists "pgcrypto";

-- =========================
-- profiles
-- =========================
create table public.profiles (
    user_id uuid primary key default gen_random_uuid(),
    full_name varchar(255) not null,
    email varchar(255) not null unique,
    password_hash text not null,
    phone varchar(50),
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- =========================
-- CATEGORIES
-- =========================
create table public.categories (
    category_id uuid primary key default gen_random_uuid(),
    name varchar(255) not null,
    description text,
    parent_category_id uuid references public.categories(category_id)
        on delete set null,
    created_at timestamptz default now()
);

-- =========================
-- PRODUCTS
-- =========================
create table public.products (
    product_id uuid primary key default gen_random_uuid(),
    category_id uuid not null references public.categories(category_id)
        on delete restrict,
    name varchar(255) not null,
    description text,
    price numeric(12,2) not null check (price >= 0),
    stock_quantity integer not null default 0 check (stock_quantity >= 0),
    image_url text,
    is_active boolean default true,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- =========================
-- CARTS
-- =========================
create table public.carts (
    cart_id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(user_id)
        on delete cascade,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- =========================
-- CART ITEMS
-- =========================
create table public.cart_items (
    cart_item_id uuid primary key default gen_random_uuid(),
    cart_id uuid not null references public.carts(cart_id)
        on delete cascade,
    product_id uuid not null references public.products(product_id)
        on delete restrict,
    quantity integer not null check (quantity > 0),
    added_at timestamptz default now(),
    unique(cart_id, product_id)
);

-- =========================
-- WISHLISTS
-- =========================
create table public.wishlists (
    wishlist_id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(user_id)
        on delete cascade,
    created_at timestamptz default now(),
    unique(user_id)
);

-- =========================
-- WISHLIST ITEMS
-- =========================
create table public.wishlist_items (
    wishlist_item_id uuid primary key default gen_random_uuid(),
    wishlist_id uuid not null references public.wishlists(wishlist_id)
        on delete cascade,
    product_id uuid not null references public.products(product_id)
        on delete cascade,
    added_at timestamptz default now(),
    unique(wishlist_id, product_id)
);

-- =========================
-- ORDERS
-- =========================
create table public.orders (
    order_id uuid primary key default gen_random_uuid(),
    user_id uuid not null references public.profiles(user_id)
        on delete restrict,
    total_amount numeric(12,2) not null check (total_amount >= 0),
    status varchar(50) not null default 'pending',
    shipping_address text not null,
    billing_address text not null,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- =========================
-- ORDER ITEMS
-- =========================
create table public.order_items (
    order_item_id uuid primary key default gen_random_uuid(),
    order_id uuid not null references public.orders(order_id)
        on delete cascade,
    product_id uuid not null references public.products(product_id)
        on delete restrict,
    quantity integer not null check (quantity > 0),
    unit_price numeric(12,2) not null check (unit_price >= 0),
    subtotal numeric(12,2) not null check (subtotal >= 0)
);

-- =========================
-- INDEXES
-- =========================
create index idx_products_category on public.products(category_id);
create index idx_carts_user on public.carts(user_id);
create index idx_orders_user on public.orders(user_id);
create index idx_cart_items_cart on public.cart_items(cart_id);
create index idx_order_items_order on public.order_items(order_id);
create index idx_wishlist_items_wishlist on public.wishlist_items(wishlist_id);

-- =========================
-- AUTO UPDATE updated_at
-- =========================
create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger trg_profiles_updated
before update on public.profiles
for each row execute function public.set_updated_at();

create trigger trg_products_updated
before update on public.products
for each row execute function public.set_updated_at();

create trigger trg_carts_updated
before update on public.carts
for each row execute function public.set_updated_at();

create trigger trg_orders_updated
before update on public.orders
for each row execute function public.set_updated_at();