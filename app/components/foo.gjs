import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

const myModifier = modifier(
  (element, [value]) => {
    console.log('running modifier', value);
  },
  { eager: false }
);

export default class Foo extends Component {
  @tracked isOpen = false;
  @tracked value;

  @action
  open() {
    console.log('open');
    this.isOpen = true;
  }

  @action
  close() {
    console.log('close');
    this.isOpen = false;
  }

  @action
  setValue(value) {
    console.log('setValue');
    this.value = value;
  }

  <template>
    <p>
      To reproduce the error, click open, then close.
    </p>

    <button type="button" class="open" {{on "click" this.open}}>
      Open
    </button>

    <button
      type="button"
      class="close"
      {{on "click" this.close}}
      {{on "click" (fn this.setValue "foo")}}
    >
      Close
    </button>

    <div {{(if this.isOpen (modifier myModifier this.value))}}>
      Hello World
    </div>
  </template>
}
