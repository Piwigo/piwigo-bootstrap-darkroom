{combine_script id="livevalidation" load="footer" path=$CONTACT_FORM_PATH|cat:"template/livevalidation.min.js"}

{footer_script require='livevalidation'}
(function(){
  {if $contact.mandatory_name and !$contact.is_logged}
  var author = new LiveValidation('author', {ldelim} onlyOnSubmit: true });
  author.add(Validate.Presence, {ldelim} failureMessage: "{'Please enter a name'|translate}" });
  {/if}

  {if $contact.mandatory_mail and (!$contact.is_logged or empty($contact.email))}
  var email = new LiveValidation('email', {ldelim} onlyOnSubmit: true });
  email.add(Validate.Presence, {ldelim} failureMessage: "{'Please enter an e-mail'|translate}" });
  email.add(Validate.Email, {ldelim} failureMessage: "{'mail address must be like xxx@yyy.eee (example : jack@altern.org)'|translate}" });
  {/if}

  var subject = new LiveValidation('subject', {ldelim} onlyOnSubmit: true });
  subject.add(Validate.Presence, {ldelim} failureMessage: "{'Please enter a subject'|translate}" });
  subject.add(Validate.Length, {ldelim} maximum: 100,
    tooLongMessage: "{'%s must not be more than %d characters long'|translate:'':100}"
    });

  var content = new LiveValidation('cf_content', {ldelim} onlyOnSubmit: true });
  content.add(Validate.Presence, {ldelim} failureMessage: "{'Please enter a message'|translate}" });
  content.add(Validate.Length, {ldelim} maximum: 2000,
    tooLongMessage: "{'%s must not be more than %d characters long'|translate:'':2000}",
    });
}());
{/footer_script}


{if $ContactForm_before}
<div class="contact desc">{$ContactForm_before}</div>
{/if}

<div class="contact">
  <form method="post" action="{$F_ACTION}">
    <div class="form-group">
      <label for="author">{'Your name'|translate}</label>
      <input class="form-control" type="text" name="author" id="author"{if $contact.is_logged} value="{$contact.author|escape:html}" readonly{else} placeholder="{'Your name'|translate}"{/if}>
    </div>
    <div class="form-group">
      <label for="email">{'Your e-mail'|translate}</label>
      <input class="form-control" type="email" name="email" id="email"{if $contact.is_logged} value="{$contact.email|escape:html}" readonly{else} placeholder="{'Your e-mail'|translate}"{/if}>
    </div>
    <div class="form-group">
      <label for="subject">{'Subject'|translate}</label>
      <input class="form-control" type="text" name="subject" id="subject" placeholder="{$contact.subject|escape:html}">
    </div>
    <div class="form-group">
      <label for="cf_content">{'Message'|translate}</label>
      <textarea class="form-control" name="content" id="cf_content" rows="10">{$contact.content}</textarea>
    </div>
    {if isset($CRYPTO)}
      {$CRYPTO.parsed_content}
    {/if}
    {if isset($EASYCAPTCHA)}
      {$EASYCAPTCHA.parsed_content}
    {/if}
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="send_copy" name="send_copy">
      <label class="form-check-label" for="send_copy">{'Send copy to my email'|translate}</label>
    </div>
    <input type="hidden" name="key" value="{$KEY}" />
    <button type="submit" class="btn btn-primary">{'Send'|translate}</button>
  </form>
</div>

{if $ContactForm_after}
<div class="contact desc">{$ContactForm_after}</div>
{/if}
