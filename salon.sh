#!/bin/bash

list_services() {
    echo "~~~~~ MY SALON ~~~~~"
    echo ""
    echo "Welcome to My Salon, how can I help you?"
    psql --username=freecodecamp --dbname=salon -c "
    SELECT service_id, name FROM services;
    " -t -A | while IFS='|' read -r service_id service_name; do
        echo "$service_id) $service_name"
    done
}

is_valid_service() {
    local service_id=$1
    psql --username=freecodecamp --dbname=salon -t -A -c "
    SELECT COUNT(*) FROM services WHERE service_id = $service_id;
    " | grep -q '1'
}

phone_exists() {
    local phone=$1
    psql --username=freecodecamp --dbname=salon -t -A -c "
    SELECT COUNT(*) FROM customers WHERE phone = '$phone';
    " | grep -q '1'
}

add_customer() {
    local phone=$1
    local name=$2
    psql --username=freecodecamp --dbname=salon -c "
    INSERT INTO customers (name, phone) VALUES ('$name', '$phone');
    "
}

get_customer_id() {
    local phone=$1
    psql --username=freecodecamp --dbname=salon -t -A -c "
    SELECT customer_id FROM customers WHERE phone = '$phone';
    "
}

get_service_name() {
    local service_id=$1
    psql --username=freecodecamp --dbname=salon -t -A -c "
    SELECT name FROM services WHERE service_id = $service_id;
    "
}

create_appointment() {
    local customer_id=$1
    local service_id=$2
    local time=$3
    psql --username=freecodecamp --dbname=salon -c "
    INSERT INTO appointments (customer_id, service_id, time) VALUES
    ($customer_id, $service_id, '$time');
    "
}

# Bucle principal para seleccionar un servicio válido
while true; do
    list_services
    echo ""
    echo "Please select a service by entering the service ID:"
    read SERVICE_ID_SELECTED

    if is_valid_service "$SERVICE_ID_SELECTED"; then
        break
    else
        echo "I could not find that service. Please select a valid service."
    fi
done

echo "What's your phone number?"
read CUSTOMER_PHONE

if phone_exists "$CUSTOMER_PHONE"; then
    CUSTOMER_ID=$(get_customer_id "$CUSTOMER_PHONE")
    CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -t -A -c "
    SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';
    ")
else
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    add_customer "$CUSTOMER_PHONE" "$CUSTOMER_NAME"
    CUSTOMER_ID=$(get_customer_id "$CUSTOMER_PHONE")
fi

SERVICE_NAME=$(get_service_name "$SERVICE_ID_SELECTED")
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

create_appointment "$CUSTOMER_ID" "$SERVICE_ID_SELECTED" "$SERVICE_TIME"

echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
