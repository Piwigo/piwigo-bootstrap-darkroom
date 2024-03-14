{if $ContactForm_before}
<div class="contact desc">{$ContactForm_before}</div>
{/if}

<div class="contact">
  <form method="post" action="{$F_ACTION}">
    <div class="form-group">
      <label for="author">{'Your name'|translate}</label>
      <input class="form-control" type="text" name="author" id="author"{if $contact.is_logged} value="{$contact.author|escape:html}" readonly{else} placeholder="{'Your name'|translate}"{/if}{if $contact.mandatory_name and !$contact.is_logged} required{/if}>
    </div>
    <div class="form-group">
      <label for="email">{'Your e-mail'|translate}</label>
      <input class="form-control" type="email" name="email" id="email"{if $contact.is_logged} value="{$contact.email|escape:html}" readonly{else} placeholder="{'Your e-mail'|translate}"{/if}{if $contact.mandatory_mail and (!$contact.is_logged or empty($contact.email))} required{/if}>
    </div>
    <div class="form-group">
      <label for="subject">{'Subject'|translate}</label>
      <input class="form-control" type="text" name="subject" id="subject" placeholder="{$contact.subject|escape:html}" required>
    </div>
    <div class="form-group">
      <label for="cf_content">{'Message'|translate}</label>
      <textarea class="form-control" name="content" id="cf_content" rows="10" required>{$contact.content}</textarea>
    </div>
    {if isset($CRYPTO)}
      {$CRYPTO.parsed_content}
    {/if}
    {if isset($EASYCAPTCHA)}
      {$EASYCAPTCHA.parsed_content}
    {/if}
    <input type="hidden" name="key" value="{$KEY}" />
    <button type="submit" name="send_mail" class="btn btn-primary">{'Send'|translate}</button>
  </form>
</div>

{if $ContactForm_after}
<div class="contact desc">{$ContactForm_after}</div>
{/if}
