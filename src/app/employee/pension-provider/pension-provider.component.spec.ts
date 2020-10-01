
    import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { PensionProviderComponent } from './pension-provider.component';

describe('PensionProviderComponent', () => {
  let component: PensionProviderComponent;
  let fixture: ComponentFixture<PensionProviderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PensionProviderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PensionProviderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

