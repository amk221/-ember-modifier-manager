import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class Foo extends Component {
  @tracked isOpen = false;
  @tracked value;

  myModifier = modifier(
    (element, [value]) => {
      console.log('running modifier', value);
    },
    { eager: false },
  );

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
}
