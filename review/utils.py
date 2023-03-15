from ippanel import Client


def send_review_order(machine_name, mobile):
    api_key = 'oV49VQNYQv37gwIQsYjAJp8URE3RgL-z06w2sUfTiEY='
    sms = Client(api_key)
    pattern_values = {
        "machine_name": machine_name,
    }

    try:
        bulk_id = sms.send_pattern(
            "k58n4blrcu",  # pattern code
            "3000505",  # originator
            mobile,  # recipient
            pattern_values,  # pattern values
        )
        message = sms.get_message(bulk_id)
        return message
    except:
        return False
